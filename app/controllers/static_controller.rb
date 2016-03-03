class StaticController < ApplicationController
  def index
    @tutorials = policy_scope(Tutorial.limit(10).order("RANDOM()"))
  end

  def search
    @categories = Category.search(params[:q]).to_a
    @users = User.search(params[:q]).to_a
    tutorial = policy_scope(Tutorial)
    @tutorials = tutorial.search(params[:q]).to_a
    template = policy_scope(Template)
    @templates = template.search(params[:q]).to_a
    info = policy_scope(Info)
    @infos = info.search(params[:q]).to_a
    infopage = policy_scope(Infopage)
    @infopages = infopage.search(params[:q]).to_a
    all = @categories + @tutorials + @templates + @infopages + @infos + @users
    @all = Kaminari.paginate_array(all).page(params[:page]).per(30)
  end
end
