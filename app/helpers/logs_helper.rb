module LogsHelper
  def log_serviced(log)
    log.serviced ? "serviced" : ""
  end
end
