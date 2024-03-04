module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end

      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each_with_index do |post, index|
      puts "#{index} - #{post}"
    end
  end

  def show
    puts 'Type identification number to show a post: '
    user_input_index = gets.to_i
    puts @posts[user_input_index]
  end

  def create
    puts 'Type post to create: '
    user_input_text = gets.chomp
    @posts << user_input_text
    @posts.each_with_index do |post, index|
      puts "#{index} - #{post}" if @posts[index] == user_input_text
    end
  end

  def update
    puts 'Type identification number to update a post: '
    user_input_index = gets.to_i
    puts 'Type post to update: '
    user_input_text = gets.chomp
    @posts[user_input_index] = user_input_text
    @posts.each_with_index do |post, index|
      puts "#{index} - #{post}" if @posts[index] == user_input_text
    end
  end

  def destroy
    puts 'Type identification number to delete a post: '
    user_input_index = gets.to_i
    @posts.delete_at(user_input_index)
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit)'
      choice = gets.chomp
      PostController.connection(@routes['posts']) if choice == '1'
      break if choice == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
