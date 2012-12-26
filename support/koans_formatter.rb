require "rspec/core/formatters/base_formatter"

class KoansFormatter < RSpec::Core::Formatters::BaseFormatter
  def initialize(output)
    #puts "==================="
    #puts "entering initialize"
    super(output)
    @passed_count = 0
    #puts "exiting initialize"
    #puts "==================="
  end

  def start(example_count)
    #puts "==================="
    #puts "entering start"
    super(example_count)
    #puts "exiting start"
    #puts "==================="
  end

  def example_group_started(example_group)
    #puts "==================="
    #puts "entering example_group_started"
    super(example_group)
    #puts "exiting example_group_started"
    #puts "==================="
  end

  def example_started(example)
    #puts "==================="
    #puts "entering example_started"
    super(example)
    #puts "exiting example_started"
    #puts "==================="
  end

  def example_passed(example)
    #puts "==================="
    #puts "entering example_passed"
    @output.puts green("About#{example.example_group.description}\##{example.description} has expanded your awareness")
    @passed_count += 1
    #puts "exiting example_passed"
    #puts "==================="
  end

  def example_pending(example)
    #puts "==================="
    #puts "entering example_pending"
    super(example)
    #puts "exiting example_pending"
    #puts "==================="
  end

  def example_failed(example)
    super(example)
    if caller.any? { |method| method.include? "fail_filtered" }
      puts red("About#{example.example_group.description}\##{example.description} has damaged your karma.")
    end
    exit
  end

  def start_dump
    #puts "==================="
    #puts "entering start_dump"
    super
    output.puts "#{@passed_count} of #{@example_count} completed"
    #puts "exiting start_dump"
    #puts "==================="
  end

  def dump_pending
    #puts "==================="
    #puts "entering dump_pending"
    super
    #puts "exiting dump_pending"
    #puts "==================="
  end

  def dump_failures
    #puts "==================="
    #puts "entering dump_failures"
    super
    #puts "exiting dump_failures"
    #puts "==================="
  end

  def dump_summary(duration, example_count, failure_count, pending_count)
    #puts "==================="
    #puts "entering dump_summary"
    super(duration, example_count, failure_count, pending_count)
    #puts "exiting dump_summary"
    #puts "==================="
  end

  def format_backtrace(backtrace, example)
    #puts "==================="
    #puts "entering format_backtrace"
    super(backtrace, example)
    #puts "exiting format_backtrace"
    #puts "==================="
  end

  def close
    #puts "==================="
    #puts "entering close"
    super
    #puts "exiting close"
    #puts "==================="
  end

  protected

  def color(text, color_code)
    color_enabled? ? "#{color_code}#{text}\e[0m" : text
  end

  def bold(text)
    color(text, "\e[1m")
  end

  def red(text)
    color(text, "\e[31m")
  end

  def green(text)
    color(text, "\e[32m")
  end

  def yellow(text)
    color(text, "\e[33m")
  end

  def blue(text)
    color(text, "\e[34m")
  end

  def magenta(text)
    color(text, "\e[35m")
  end

  def cyan(text)
    color(text, "\e[36m")
  end

  def white(text)
    color(text, "\e[37m")
  end

  def short_padding
    '  '
  end

  def long_padding
    '     '
  end

end

