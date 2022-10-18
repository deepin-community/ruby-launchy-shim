module Launchy
  def self.open(uri, options = {})
    if xdg_open_available
      system('xdg-open', uri)
    else
      puts "W: can't open #{uri} without xdg-open; install the `xdg-utils` package!"
    end
  end

  private

  def self.xdg_open_available
    system('which xdg-open >/dev/null')
  end
end
