helpers do
  def find_and_ensure_entry(id)
    entry = Entry.find_by(id: id)
    puts params
    halt(404, erb(:'404')) if entry.nil?
    entry
  end
end
