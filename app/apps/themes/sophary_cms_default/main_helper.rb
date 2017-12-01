module Themes::SopharyCmsDefault::MainHelper
  def self.included(klass)
    klass.helper_method [:mycms_get_nav_menu] rescue "" # here your methods accessible from views
  end

  def sophary_cms_default_settings(theme)
    # callback to save custom values of fields added in my_theme/views/admin/settings.html.erb
  end

  # callback called after theme installed
  def sophary_cms_default_on_install_theme(theme)
    mycms_add_default_pages
    mycms_add_fields_to_contact_page
    mycms_add_faqs_post_type
    mycms_add_fields_to_faq_post_type
  end

  def mycms_add_default_pages
    page_post_type = current_site.the_post_type('page')
    if page_post_type.present?
      pages = ['Home','About','Contact','FAQ']

      pages.each do |page|
        formatted_page = page.downcase.parameterize
        exist_page = current_site.the_post_type('page').the_posts.where("slug like '%#{formatted_page}%'")
        unless exist_page.present?
          page_post_type.add_post(title: page, content: 'lorem_ipsum')
        end
      end
    end
  end

   def mycms_add_fields_to_contact_page
    page = current_site.the_post_type('page').the_post('contact')
    if page.get_field_groups.where(slug: 'contact-fileds').blank?
      file_field_group = page.add_field_group({ name: 'Contact Fileds', slug: 'contact-fileds' }, 'Post')
      file_field_group.add_field({ name: 'Contact Mail', slug: 'contact-mail' }, { field_key: 'text_box', required: true, default_value: 'info@companyname.com'})
      file_field_group.add_field({ name: 'Phones', slug: 'phones' }, { field_key: 'text_box', required: true, multiple: true, default_value: '070-xxxx-xxxx'})
      file_field_group.add_field({ name: 'Address', slug: 'address' }, { field_key: 'editor', required: true, default_value: 'Lorem Ipsum dolor sit amet, consectetur adipiscing elit.' })
      file_field_group.add_field({ name: 'Embed Map Url', slug: 'embed-map-url' }, { field_key: 'url', required: true, default_value: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d250151.15120764848!2d104.75010047461711!3d11.579666934905125!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3109513dc76a6be3%3A0x9c010ee85ab525bb!2sPhnom+Penh!5e0!3m2!1sen!2skh!4v1507699269146' })
    end
  end

  def mycms_add_faqs_post_type
    if current_site.the_post_type('faqs').blank?
      faqs = current_site.post_types.create(name: 'Faqs', slug: 'faqs')
      options = {
        has_category: false,
        has_content: true,
        has_tags: false,
        has_summary: false,
        has_comments: false,
        has_picture: false,
        has_template: false,
        has_keywords: false,
        contents_route_format: 'post_of_posttype'
      }
      faqs.set_meta('_default', options)
    end
  end

  def mycms_add_fields_to_faq_post_type
    faqs = current_site.the_post_type('faqs')
    if faqs.get_field_groups.where(slug: 'faqs-fields').blank?
      faqs_field_group = faqs.add_field_group({ name: 'faqs Fields', slug: 'faqs-fields' } )

      faqs_field_group.add_field({ name: 'Text Box Field', slug: 'text-box-field' }, { field_key: 'text_box', required: true } )
      faqs_field_group.add_field({ name: 'Text Area Field', slug: 'text-area-field' }, { field_key: 'text_area', required: true } )
      faqs_field_group.add_field({ name: 'Editor Field', slug: 'editor-field' }, { field_key: 'editor', required: true } )
      faqs_field_group.add_field({ name: 'Image Field', slug: 'image-field' }, { field_key: 'image', required: true } )
    end
  end

  def mycms_get_nav_menu(key = 'main_menu', class_name = "navigation")
    option = {
      menu_slug: key,
      container_class: class_name,
      container_id: 'main-menu-ul',
      item_class_parent: 'dropdown',
      sub_class:        'dropdown-menu submenu-dropdown',
      callback_item: lambda do |args|
        args[:link_attrs] = "data-title='#{args[:link][:name].parameterize}'"
        if args[:has_children]
          args[:settings][:after] = "<span class='dropdown-icon'><i class='fa fa-angle-down' aria-hidden='true'></i></span>"
          args[:link_attrs] += "data-toggle='dropdown'"
        end
      end
    }
    draw_menu(option)
  end

  # callback executed after theme uninstalled
  def sophary_cms_default_on_uninstall_theme(theme)
  end
end
