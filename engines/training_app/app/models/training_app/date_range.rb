module TrainingApp
  class DateRange
    def initialize(start_date, end_date = nil)
      @start_date = start_date
      @end_date = end_date
    end

    def to_s
      return "" if @start_date.nil?
      if @end_date.nil? || @start_date == @end_date
        date = @start_date.strftime('%B %e, %Y')
      else
        date = "#{@start_date.strftime('%B %e')} - #{@end_date.strftime('%B %e')}, #{@start_date.strftime('%Y')}"
      end
      date.gsub("  ", " ")
    end
  end
end
