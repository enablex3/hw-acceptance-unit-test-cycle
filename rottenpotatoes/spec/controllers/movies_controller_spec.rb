require 'rails_helper'

describe MoviesController do
    
    describe "#director" do 
       context "When specified movie has a director" do
         
         it "should find movies with the same director" do
         
           @movie_id = "1234"
           @movie = double('fake_movie', :director => 'George Lucas')
         
           expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
           expect(@movie).to receive(:similar_movies)
         
           get :director, :id => @movie_id
         
           expect(response).to render_template(:director)
        end
       end
       context "When specified movie has no director" do
           
           it "should redirect to the movies page" do
               
               @movie_id = "1234"
               @movie = double('fake_movie').as_null_object
               
               expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
               
               get :director, :id => @movie_id
               
               expect(response).to redirect_to(movies_path)
               
           end
           
       end
    end
    
    describe "#edit" do
        context "When specified movie is selected" do
            it "should redirect to edit movie path" do
                
              @movie_id = "1234"
              @movie = double('fake_movie', :id => @movie_id)
               
              expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
               
              get :edit, :id => @movie_id
               
              expect(response).to render_template(:edit)
                
            end
        end
    end
end