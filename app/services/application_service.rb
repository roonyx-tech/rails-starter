class ApplicationService
  def self.call(...)
    new(...).call
  end

  def call
    self
  end
end
