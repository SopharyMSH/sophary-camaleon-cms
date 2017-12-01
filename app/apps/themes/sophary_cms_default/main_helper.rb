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
