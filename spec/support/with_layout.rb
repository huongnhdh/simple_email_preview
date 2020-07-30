module WithLayout
  def with_layout(layout)
    SimpleEmailPreview.layout = layout
    yield
  ensure
    SimpleEmailPreview.layout = nil
  end
end
