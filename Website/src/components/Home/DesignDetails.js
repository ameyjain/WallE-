import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class DesignDetails extends Component {

  render() {
      return (
        <div className="whiteSection align-center">
        <div className="designHeading" id="line1">
          <span className="DesignHeading">MINIMAL & SMART</span>
        </div>
        <div className="designHeading">
          <span className="DesignHeading">DESIGN</span>
        </div>
        <div id="imageDiv1">
          <img src="https://static.wixstatic.com/media/42dbaa_5a33625cc7c04c7b933fdcb7008322a0.png/v1/fill/w_531,h_611,al_c,usm_0.66_1.00_0.01/42dbaa_5a33625cc7c04c7b933fdcb7008322a0.png"/>
        </div>
          <div className="align-left" id="textDiv">
            <div className="divSpan">
              <span>Energy efficient indicators</span>
            </div>
            <div className="divSpan">
              <span>Connected device indicators</span>
            </div>
            <div className="divSpan">
              <span>Sleek aluminium surface</span>
            </div>
            <div className="divSpan">
              <span>Colorful customizable interiors</span>
            </div>
          </div>
          <div id="imageDiv2">
            <img src="https://static.wixstatic.com/media/42dbaa_5a33625cc7c04c7b933fdcb7008322a0.png/v1/fill/w_531,h_611,al_c,usm_0.66_1.00_0.01/42dbaa_5a33625cc7c04c7b933fdcb7008322a0.png"/>
          </div>
        </div>
      )
  }
}
