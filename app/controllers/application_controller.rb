class ApplicationController < ActionController::Base
  private

  def f x
    return [10, 20, 30].each { |i| i - x }.select { |i| i % 2 == 0 }.map {|i| "_#{i}_" }.each { |s| p s }
  end
end
