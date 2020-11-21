class TweetsController < ApplicationController
    before_action :get_tweet, only: [:show, :update, :destroy]

    def index
        render(json: { tweets: Tweet.all })
      end
    
      def show
        # Input comes in from the `params` hash
        render(json: Tweet.find(params[:id]))
      end
    
      def create
        tweet = Tweet.new(tweet_params)
    
        if tweet.save
          render(json: { tweet: tweet }, status: 201)
        else
          # Unprocessable Entity
          render(json: { tweet: tweet }, status: 422)
        end
      end
    
      def update
        tweet = Tweet.find(params[:id])
        tweet.update(tweet_params)
        render(json: { tweet: tweet })
      end
    
      def destroy
        tweet = Tweet.destroy(params[:id])
        render(status: 204)
      end

      def meta_controller
        render json: { author: "President Kool-chair", last_updated: "10 Jan 2017" }
      end
    
      private
    
      def tweet_params
        # Returns a sanitized hash of the params with nothing extra
        params.require(:tweet).permit(:title, :content, :author)
      end
  
      def get_tweet
          @tweet = Tweet.find(params[:id])
      end
end