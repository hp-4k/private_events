module EventsHelper
  
  def format_date(date_object)
    d = DateTime.parse(date_object.to_s)
    d.strftime("%d %B %Y %H:%M")
  end
  
end