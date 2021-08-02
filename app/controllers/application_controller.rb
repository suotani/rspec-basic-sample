class ApplicationController < ActionController::Base

  
  protected

  def terminal
    while(true) do
      print "terminal > "
      command = gets.chomp
      if command == "exit"
        break
      else
        begin
        p eval(command, binding)
        rescue => e
          p e
          next
        end
      end
    end
  end
end