class ReaderFile #reads from message.txt file
  def read
    first_message = ARGV[0]
    File.read(first_message).chomp
  end
end
