module Admin
  class ScoreboardController < ApplicationController
    before_action :require_admin

    def show

      contest = Contest.find(scoreboard_params[:contest_id])
      @teams = ActiveTeamsService.new(contest: contest, teams: contest.teams).call
    end

    private

      def scoreboard_params
        params.permit(:contest_id, :logged_in)
      end
  end
end
