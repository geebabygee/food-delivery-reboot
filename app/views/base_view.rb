class BaseView # Parent class which has methods that work in alllll views

  def display(elements)
    elements.each do |element|
      puts element.display_in_list # this method can be found in the model as an instance method which can be called on element as element is an instance.
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}, please!"
    gets.chomp
  end
end
