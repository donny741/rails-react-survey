module AdminHelper
    def breadcrumbs
        @breadcrumbs ||= [{title: "Apklausa", path: admin_survey_index_path}]
    end
    def add_breadcrumbs title, path = "#"
        breadcrumbs << {title: title, path: path}
    end
    def render_breadcrumbs
        render partial: 'admin/shared/navbar', locals: { nav: breadcrumbs }
    end
end