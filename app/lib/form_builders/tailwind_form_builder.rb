module FormBuilders
  class TailwindFormBuilder < ActionView::Helpers::FormBuilder
    def text_field(method, options = {})
      field_wrapper(super(method, common_field_styles(method, options)))
    end

    def number_field(method, options = {})
      field_wrapper(super(method, common_field_styles(method, options)))
    end

    def text_area(method, options = {})
      field_specific_style = 'resize-none h-32'
      field_wrapper(super(method, common_field_styles(method, options, field_specific_style)))
    end

    def email_field(method, options = {})
      field_wrapper(super(method, common_field_styles(method, options)))
    end

    def telephone_field(method, options = {})
      field_wrapper(super(method, common_field_styles(method, options)))
    end

    def select(method, choices = nil, options = {}, html_options = {})
      html_options = common_field_styles(method, html_options)
      field_wrapper(super(method, choices, options, html_options))
    end

    def submit(value = nil, options = {})
      default_style = 'mt-12 bg-accent text-zinc-100 font-normal text-sm py-3 px-4 rounded-3xl flex mx-auto items-center justify-center gap-2 cursor-pointer'

      super(value, options.merge({ class: default_style }))
    end

    def label(method, text = nil, options = {})
      default_style = 'text-zinc-500 block mb-3 mt-8'

      super(method, text, options.merge({ class: default_style }))
    end

    private

    def field_wrapper(field_html)
      "<div>#{field_html}</div>".html_safe
    end

    def common_field_styles(method, options = {}, field_specific_style = '')
      default_style = 'bg-orange-50 focus:ring focus:ring-orange-200 focus:ring-opacity-50 rounded-lg w-full'
      options[:class] =
        [options[:class], default_style, field_specific_style, border_color_classes(method)].compact.join(' ')
      options
    end

    def border_color_classes(method)
      if errors_for(method).present?
        'border border-red-400 focus:border-rose-200'
      else
        'border border-transparent'
      end
    end

    def errors_for(method)
      return unless @object.present? && method.present?

      @object.errors[method]
    end
  end
end
