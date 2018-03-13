module ApplicationHelper
  def fdate arg
    arg.present? ? Date.parse(arg).strftime("%Y/%m/%d") : ""
  end
end
