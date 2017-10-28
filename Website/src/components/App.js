import React, { Component } from 'react'
import { Footer } from './Footers'
import { Header } from './Header'
import { NavBar } from './Header'
import { Creators } from './Home'
import { InfoGrid } from './Home'
import $ from 'jquery';

export default class App extends Component {

  render() {
    return (
      <div id="page-wrapper">

          <NavBar />

          <Header />

          <div id="two" className="bg">
            <div className="heading1">
              <h2 id="line1" >SIMPLE & INTUITIVE DESIGN</h2>
            </div>
          </div>

          <InfoGrid />

          <div id="three" className="bg">
            <div id="mytextbox" className="textbox align-left">
              <span className="textHeading">HOW IT WORKS</span>
              <ul>
                <li>Plug power cable into wall-e speaker and power adapter to wall socket.</li>
                <li>Install Google Home app and Alexa App on your device (phone/tablet).</li>
                <li>Connect the speaker to the same wifi network as your smart device</li>
                <li>Follow instructions to set up google home.</li>
                <li>Follow instructions to set up Alexa.</li>
              </ul>
            </div>
          </div>

          <Creators />

          <Footer/>

      </div>
    );
  }
}
