//
//  AppBrain.swift
//  Fanga Dagen
//
//  Created by Henrik Källenius on 29.11.20.
//

import Foundation
import UIKit

struct AppBrain {
    
    //array for adding names of selected categories
    var selectedCategories = [String]()
    
    //array to check if day has already been completed
    var DayNumber = [Int]()
    
    //dictionary of array with interests and challenges
    var categories = ["Sports" : [
                        "Watch a game of a sport you have never really seen before.",
                        "Today is the day to get into shape! Create a four week workout-plan and just do it.",
                        "Go for a run with a friend today! Try out a route that you haven’t done before.",
                        "Rally together a group of friends and do any kind of physical activity together.",
                        "Have a friend who does an unusual sport? Ask him if you can join him to his next practice.",
                        "Go for a one mile run. Try to beat your best time!",
                        "Ask a friend to send you a workout for today and complete it.",
                        "Tired of all sports? Invent a new one today, because why not!",
                        "Play any type of sport today for which you have to use a stick.",
                        "Play any type of sport today for which you have to use a ball that is not round.",
                        "Play any type of sport today which doesn't use a ball.",
                        "Go for a 5 mile run. You can do it!",
                        "Go for a 10 mile run. You're unstoppable!",
                        "Hike to the top of a mountain or hill close-by",
                        "Hot take: chess is a sport. So, go play or learn chess today"],
                      
                      "Literature" : [
                        "Write in a journal. Take a little time out of your evening routine to write down your thoughts and impressions of the day - there’s something magical about giving your thoughts a physical place.",
                        "Go to the library. Ask the librarian what their favourite book is and read it!",
                        "Emails, SMS and direct messages, ugh! Do it old-school style and send a hand written letter to a loved one.",
                        "Read a book, article or any sort of publication on a subject you know nothing about.",
                        "Read a biography or article about a person who truly inspires you.",
                        "read abook or publication of which the original language is different than English. You can read a translated copy, however!",
                        "Read any paper or concept developed by Plato.",
                        "Write your own masterpiece today! We all have that brilliant novel idea; today put it down into words.",
                        "Read at least for 30 minutes today. And captions on Instagram don't count!",
                        "Read any work written by Franz Kafka and find out what the word 'kafkaesque' means",
                        "Read any daily newspaper today.",
                        "Randomly pick a section from a newspaper and read it.",
                        "Ask any of your grandparents what there favorite book was when they were your age. read that book!."],
                      
                      "Languages" : [
                        "Learn how to greet people in five different languages.",
                        "Do you have a friend who speaks a second language? Tell that person to talk to you only in that foreign language; see if you pick up any new words or phrases.",
                        "Learn a new word and try to use it today.",
                        "Choose a random country and learn something about the origin of their native language.",
                        "German is known for having ridiculous words. Learn five new fun German words and try to incorporate it into your vocabulary.",
                        "Find out what the word 'Acquiesce' means.",
                        "Find out what the word 'Malapropism' means.",
                        "Find out what the word 'Onomatopoeia' means.",
                        "Find out what the word 'Posthumously' means.",
                        "Find out what the word 'Soliloquy' means."],
                      
                      "Random" : [
                        "Give a genuine compliment to a stranger today. It will make their day - and yours!",
                        "Today is “Get-rid-of-some-of your-clothes Day”! Declutter your closet by donating clothes you haven’t worn in a while.",
                        "“______ Appreciation Day”! Create a new holiday to celebrate someone you love.",
                        "Call someone you haven’t spoken to in at least a year and tell them you miss them.",
                        "Write a positive online review of a business you like. It makes a different!",
                        "Take as many pictures as you can of different places you will go to today, people you will meet or moments that you wish to capture!",
                        "Expand your music taste. Let you friend create a playlist for you of their favourite songs.",
                        "Schedule a call with a big group of friends!",
                        "A lot of work this week? Take some time off and do something that really entertains you."],
                      
                      "Mindfulness" : [
                        "Take 15 minutes to write down everything that made you happy today", "Show your love! Tell someone (a friend, family member, your neighbour’s dog, …) how much they mean to you or how much you appreciate them.",
                        "Take 5-10 minutes and meditate. If you enjoy that make a habitual thing out of it.",
                        "Write a letter to your future self using FutureMe.org.",
                        "Write down a quote or something powerful you heard today.",
                        "Try yoga - or to spice things up try hot yoga!",
                        "Take a nap. You deserve it!",
                        "Listen to a guided relaxation or a podcast you truly enjoy.",
                        "No-tech day! Rinse your aura by avoiding phones, laptops and TV for an entire day.",
                        "Show your love! Tell someone (a friend, family member, your neighbour’s dog, …) how much they mean to you or how much you appreciate them."],
                      
                      "Movies" :[
                        "Watch any movie that was released in 1994. Trust me, there is a lot to choose from!",
                        "Watch a foreign film you haven’t seen before. And yes, subtitles are allowed.",
                        "Watch a Quentin Tarantino movie - and if you’ve seen all of them, find out what Quentin Tarantino’s favourite movie is and watch that instead.",
                        "Have a favourite actor/actress? Find the first movie they starred in and watch it.",
                        "David Attenborough’s documentaries on wild life are one of a kind. Watch one of his documentaries and enjoy the astonishing impressions of nature.",
                        "Create a Netflix Party with friends and decide together what movie to watch."],

                      "Food" : [
                        "Try out a new local diner in a two mile radius.",
                        "Ask a friend for their favourite recipe. Recreate that meal and “Bon Appetit”!",
                        "Invite a friend for a baking session and enjoy the resulting treats.",
                        "Buy 3 vegetables you’ve never eaten before, find a recipe and make an exciting meal.",
                        "Set a ridiculously low budget and cook a dinner for friends for that budget."],

                      "Nature" : [
                        "Go on a hike with a friend or family member. Leave your phones at home and enjoy the peacefulness of nature.",
                        "Watch a sunset or a sunrise. Take a loved one with you if you want to.",
                        "Go to a park close-by and pet any animal that you come across.",
                        "Plant a tree, because we love trees!",
                        "Stargazing! Spread a blanket on the ground, get comfy, and look up at the cosmos. See if you can spot any constellations and/or made-up shapes."],
                      
                      "Learning" : [
                        "Go on to wikipedia and click on “Random Page”. Read that article!",
                        "Do or try that one thing you’ve been procrastinating on; we all know what I’m talking about. Start a blog, write a song and don’t stop until you have something complete.",
                        "Get a globe or a map, close your eyes and place your finger randomly on a country. Now go and learn as much as you can about the country.",
                        "Watch How To Videos on something you’ve always wanted to learn.",
                        "Work on an art project. You don’t have to be a good painter for this, because art is what you make out of it!",
                        "Watch a TED Talk; you will learn something new.",
                        "Send yourself to school! Sites like Coursera have a wide range of online courses that you can take - for free!",
                        "Learn a new fun fact everyday!",
                        "Learn how to solve a Rubik’s cube. If you already know how to, try to solve it under 30 seconds. And if you kana how to do that, “Chapeau!” There is nothing more I can teach you."],
                      
                      "Adventurous" : [
                        "Say ‘yes’ to everything today. You can figure out the details later.",
                        "Play tourist in your own town! Visit your city's museum or botanical garden and find out the story behind that statue downtown.",
                        "When you’re walking down the street or buying your groceries, take the time to talk to a stranger. You never know where you may make a good friend.",
                        "Write a blog. You don’t have to be a fantastic writer to have a blog.",
                        "Be proud of your look! Dress boldly today and see others melt away to the new you."],

                      "Active" : [
                        "Walk 10,000 steps today - and if that is not a challenge for you, walk 20,000 steps.",
                        "Engage in a local community service organisation. Become an active member of society!",
                        "Today is “Don’t-sit-on-your-butt Day”! Try to be as active as you can.",
                        "Dance Party! Play your favourite tune and dance for yourself in front of a mirror.",
                        "Headed somewhere? Take a different route today."],

                      "Spontaneous" : [
                        "Ask a friend to set the daily challenge for today!",
                        "Call a friend and meet up with them within the next thirty minutes. It will be an adventure!",
                        "Gather your closest friends together, climb into the car, and drive. Just drive. You don’t need a destination; just let the road take you wherever it pleases.",
                        "Rearrange your furniture. Sometimes it offers new perspectives …",
                        "Create something - Now! Build something, draw something, write something - whatever first pops into your head."]
    ]
    
    // this is an array to check whether the user has chosen enough Interests or not; look at its implementation in InterestsViewController
    var enoughInterests = [false, false, false, false, false, false, false, false, false, false, false, false]
    
    mutating func addInterest(Interest: UIButton, text: String, numb: Int) {
    Interest.isSelected = !Interest.isSelected
        if Interest.isSelected == true {
            //if Button is selected add interest to array selectedCategories
            //this array will help us generate the challenges according to the user's selection
            selectedCategories.append(text)
            //the enoughInterests array will help us to make sure that a certain amount of interests have been selected
            enoughInterests[numb] = true
        }
        else {
            selectedCategories.remove(at: selectedCategories.firstIndex(of: text)!)
            enoughInterests[numb] = false
        }
}
    //function to check if day has been completed
    mutating func checkDay(Day: UIButton, numb: Int) {
        //first check that the default array forKey: "Daynumber" is not empty
        if defaults.array(forKey: "DayNumber") != nil {
            //set array Daynumber equal to defualt array
            let DayNumber = defaults.array(forKey: "DayNumber") as! [Int]
            //if this array then contains the number of that certain day, the button should be disabled or completed
            if DayNumber.contains(numb) {
                Day.isEnabled = false
            }
        }
    }
}
