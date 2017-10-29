import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class HowItWorks extends Component {

  render() {
      return (
        <div id="three" className="parallax">
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
      )
  }
}
