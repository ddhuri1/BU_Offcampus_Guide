require 'rails_helper'

RSpec.describe LocalsController, type: :controller do
    describe "#show" do
        before(:each) do
            controller.class.skip_before_filter :current_user
            
        end
        #let(:current_user) {instance_double(User,:id => '1')}
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        context "When local exists" do
            describe "When looking to show a local" do
                it "calls the find method to retrieve the local" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Local).to receive(:find).with(id).and_return(local)
                    
                    get :show,  {:id => id}

                end
            end
        end
    end
    
    describe "#index" do
       
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        
        context "When local exists" do
            describe "When looking to show all local" do
                it "calls the all method to retrieve all local" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Local).to receive(:all).and_return(locals)
                    get :index, {:id => id}
                end
            end
        end
    end
    
    describe "#create" do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        context "When a local is created" do
            describe "When trying to create a local with the same name" do
                it "flashes a warning saying that a local with that name already exists" do
                end
            end
            describe "When trying to create a local without filling all the fields" do
                it "flashes a warning saying that was an invalid local" do
                  # expect(Local).to receive(:find).with(@id).and_return(local)
                  # get :show, {:id => id}
                  
                  #expect(flash[:warning]).to eq("Invalid local Entry.")
                end
            end
        end
    end
    
    describe "#edit" do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        context "When local exists" do
            describe "When looking to edit a local" do
                it "calls the find method to retrieve the local" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Local).to receive(:find).with(id).and_return(local)
                    get :edit, {:id => id}
                end
            end
        end
    end
  
    describe 'destroys a local' do
      let(:id) {'1'}
        let(:id2) {'2'}
        let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        it 'calls the find method to retreive the local' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            expect(Local).to receive(:find).with(id).and_return(local)
            allow(local).to receive(:destroy)
            delete :destroy, {:id => id}
        end
        it 'sets a flash message' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Local).to receive(:find).with(id).and_return(local)
            expect(local).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(flash[:notice]).to eq("Store deleted!")
        end
        
        
        it 'redirects to the groceries page' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Local).to receive(:find).with(id).and_return(local)
            allow(local).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(response).to redirect_to(locals_path)
        end
    end
end
