require 'minitest/autorun'
require 'launchy'

class LaunchyTest < MiniTest::Test

  def test_calls_xdg_open
    args_used = nil
    system = lambda { |*args| args_used = args.clone }
    Launchy.stub :xdg_open_available, true do
      Launchy.stub :system, system do
        Launchy.open('http://www.debian.org/')
      end
    end

    assert_equal ['xdg-open', 'http://www.debian.org/'], args_used
  end

  def test_warns_if_xdg_open_is_not_available
    explode = lambda { |*args| raise Exception.new("should't call xdg-open if it's not installed") }
    Launchy.stub :xdg_open_available, false do
      Launchy.stub :system, explode do
        Launchy.stub :puts, nil do
          Launchy.open('http://www.debian.org/')
        end
      end
    end
  end

end
