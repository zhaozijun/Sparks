Github link:

https://github.com/zhaozijun/Sparks

Pivotal Tracker Link:

https://www.pivotaltracker.com/n/projects/1309830

---------------------

Writeup:
_Models_
We have three models: Authors, Papers, and Questions.

An author has-many papers. This is straightforward, as an author could have several papers and the papers should be associated with their author. 

A paper has-many questions. "Questions" are question-and-answer pairs that can be attached to a paper to add more detail about a specific topic of the paper. Sometimes, they can include images that greater illustrate a point or topic within the paper. These are intended to be quick insights into particular topics or discussions of the paper, and can let a viewer focus on what they feel. A paper logically could have several of these q&a pairs, so we've made it a has-many relationship.

The author is the primary model that a user interacts with the app with. Each author has identification info and is attached to Devise, a log-in gem, that gives them the ability to create new papers or edit papers that belong to them. Additionally, they can add or remove questions/answers for each specific paper that belongs to them. They can upload papers and images with Papers and Questions, respectively.

Without logging in, regular users to the website can see a read-only version of all papers, and see what author they are associated with, but are unable to make changes. A paper is a standalone element for display, but not for editing (creating and editing requires a regular user to sign-up and become an author). We've made this so that papers are viewable for all to see, and may add a search / filtering functionality to this page in the future to make it more interesting. Papers currently do not require a PDF or Powerpoint, but we may add this as a validation in the future (for testing purposes, we don't require it at the moment. It can also be useful for an author to create a skeleton and then add the pdf later).

Questions must validate their answer, and validate that their "content" is an image (this is due to database translation: a db stores an image as binary text). We've used an image-upload system similar to uploading avatars, as the style of avatars (smaller pictures) translates well to the Q&As. 

We may add one more model in the future, but it may not necessarily be required: these will be "captions" that correspond to a slide when viewing the paper slideshow. The papers will have a slideshow in the future, and we would like to have captions associated with each slide; storing the captions may be performed by creating a light model that belongs to the paper, and contains a slide number attribute, so that viewers can see attached captions associated with a particular slide (likely, it will preload all of the captions in the html to save space). 


_Controllers_
We have two general sets of routes: Routes corresponding to "Authors", and routes corresponding to "Users". "Users" are not logged in, and only have read-only access to papers and their respective questions for viewing purposes only, while "authors" actually edit content. Authors and their corresponding routes are protected via a log-in system, and if a visitor is not logged in, they will be treated as a user and can still browse, view content, etc., using a different set of routes: "userpapershow", "userquestionindex", etc.

The papers are a nested routes of authors, and the questions are a nested model of papers. This is mainly to ensure restful authentication of the authors, so that only the correct author can modify papers and questions without the rails app needing to deal with the session. 

The questions/answers logically display along with the paper, so the controller for the paper also gets all of the questions and displays it under the paper's information.

This overall controller functionality is important for the flow and basic use cases of the app, so we include it in this iteration. For the next iterations, we want to improve the viewing page of the papers, as well as add a way to display the slides associated with a paper on the "show" paper page. This will require some javascript to display the slides (we will likely be using the Scribd api), but it will essentially be a part of the Paper show page. This page may make external calls to Scribd's API.

Note about our Cucumber tests:

We are having some trouble with using nested routing and cucumber's testing. Speficially, Cucumber creates an author id that it doesn't store in the database, and subsequently can't use for nested/further steps. This leads to an error where it then attempts to create a paper or edit a paper, and fails because it doesn't know the author id (Knowing the author id is required for routing as well, since it ensures authenticated access for editing or creating). There are 5 scenarios that fail for this reason: we explored some solutions while trying to fix it, but we could not figure it out. However, it is likely some special trick or Cucumber configuration that can solve it, and it will solve the 5 failing scenarios (which, when we run manually using "rails server", work correctly). We believe that this is due to our Devise gem -> nested routing being a slightly unconventional and we need to make Cucumber aware of it somehow, but are not exactly sure how to do it.


