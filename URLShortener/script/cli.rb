
class UrlShortener
  def initialize
    @user = get_user
  end

  def run_loop
    print_user_options
    parse_input(gets.chomp.to_i)

  end

  def print_user_options
    puts "1. Shorten a link"
    puts "2. Visit a link"
    puts "3. Get the click count for a link"
    puts "4. Get number of unique users clicking a link"
    puts "5. Get number of recent clicks"
    puts "6. Get a users submitted links"
    puts "7. Add a comment to a link"
    puts "8. See all the tags"
    puts "9. See popular links for a tag"
  end


  def get_user
    puts "Welcome to the URL Shortener"
    puts "Please enter your name:"
    User.get_user(gets.chomp)
  end

  def parse_input(num)
    case num
    when 1
      puts shorten_link
    when 2
      puts visit_link
    when 3
      puts total_clicks
    when 4
      puts unique_clicks
    # These methods havent been made yet
    # when 5
    #   puts recent_clicks
    # when 6
    #   puts submitted_user_links
    # when 7
    #   puts add_comment
    # when 8
    #   puts print_tags
    # when 9
    #   puts popular_links
    else
      puts "Invalid input"
    end
  end

  def shorten_link
    link = get_link
    @user.shorten(link)
  end

  def visit_link
    link = get_link
    @user.open(link)
  end

  def total_clicks
    link = get_link
    link_obj = Url.get_url(link)
    link_obj.total_clicks
  end

  def unique_clicks
    link = get_link
    link_obj = Url.get_url(link)
    link_obj.unique_clicks
  end

  def get_link
    puts "Please enter the link you want to work with:"
    gets.chomp
  end
end