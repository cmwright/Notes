class NotesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @notes = current_user.notes
  end

  def new
    @note = current_user.notes.new
  end

  def create
    @note = current_user.notes.create(params[:note])

    respond_to do |format|
      format.json { render :json => @note.to_json }
    end
  end

  def edit
    @note = current_user.notes.find_by_id(params[:id])
  end

  def update
    @note = current_user.notes.find_by_id(params[:id])
    @note.update_attributes(params[:note])

    respond_to do |format|
      format.json { render :json => @note.to_json }
    end
  end

  def destroy
    @note = current_user.notes.find_by_id(params[:id])
    @note.destroy if @note.present?

    respond_to do |format|
      format.json { render :json => @note.to_json }
    end
  end
end
