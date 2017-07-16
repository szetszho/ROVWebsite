module Admin::AdminHelper

  def details_of(data)
    header = data.class.name.titleize
    body   = data.attributes.map { |name, value| content_tag(:tr, content_tag(:td, name) + content_tag(:td, value)) }.join
    "<table border=\"1\"><tr><th colspan=\"2\">#{header}</th></tr>#{body}</table>".html_safe
  end

  def tableize(data, fields)
    header = fields.keys.map { |x| content_tag(:th, x.to_s.titleize) }.join
    body   = data.map do |x1|
      row = fields.map do |x2, x3|
        raise(TypeError.new('Symbol expected, %s given') % x2.class) unless x2.is_a?(Symbol)
        case x3
          when true, false, nil
            cell = x1.public_send(x2).to_s
          when String, Symbol
            cell = x1.public_send(x3).to_s
          when Array, Hash
            cell = x3.reduce(x1, &:public_send).to_s
          when Proc
            cell = x3.call(x1, x2).to_s
          else
            raise(TypeError.new('true, false, nil, String, Symbol or Proc expected, %s given' % x3.class))
        end
        content_tag(:td, cell.html_safe)
      end.join
      content_tag(:tr, row.html_safe)
    end.join
    "<table border=\"1\"><tr>#{header}</tr>#{body}</table>".html_safe
  end

end
