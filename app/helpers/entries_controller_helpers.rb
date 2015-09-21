helpers do
  def find_and_ensure_entry
    pass if request.path_info.match /new/

    @entry = Entry.find_by(id: params[:id])
    puts params
    halt(404, erb(:'404')) if @entry.nil?
  end
end
