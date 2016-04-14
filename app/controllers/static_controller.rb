class StaticController < ApplicationController
  def index
    @tutorials = policy_scope(Tutorial.includes(:category, :contributors, :author).limit(12).order("RANDOM()"))
  end

  def search
    @categories = Category.search(params[:q]).to_a
    @users = User.search(params[:q]).to_a
    snippet = policy_scope(Snippet.includes(:tutorial, :template, :category))
    @snippets = snippet.search(params[:q]).to_a
    tutorial = policy_scope(Tutorial.includes(:category))
    @tutorials = tutorial.search(params[:q]).to_a
    template = policy_scope(Template.includes(:category))
    @templates = template.search(params[:q]).to_a
    info = policy_scope(Info.includes(:tutorial))
    @infos = info.search(params[:q]).to_a
    infopage = policy_scope(Infopage.includes(:template))
    @infopages = infopage.search(params[:q]).to_a
    all = @categories + @tutorials + @templates + @infopages + @infos + @users + @snippets
    @all = Kaminari.paginate_array(all).page(params[:page]).per(30)
  end


end
