import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class InfoGrid extends Component {

  render() {
      return (
        <section className="wrapper style1 align-center">
          <div className="inner">
            <div className="items style1 medium onscroll-fade-in">
              <section>
                <span className="icon style2 major fa-wifi"></span>
                <h3>WIRELESS</h3>
                <p>Just connect the speaker to same wifi as your smart phone or tablet and you are good to go.</p>
              </section>
              <section>
                <span className="icon style2 major fa-microphone"></span>
                <h3>POWERFUL MIC</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
              </section>
              <section>
                <span className="icon style2 major fa-mobile"></span>
                <h3>EASY CONTROL</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
              </section>
              <section>
                <span className="icon style2 major fa-cog"></span>
                <h3>SIMPLE SETUP</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
              </section>
              <section>
                <span className="icon style2 major fa-cube"></span>
                <h3>SUPIRIOR DESIGN</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
              </section>
              <section>
                <span className="icon style2 major fa-paper-plane"></span>
                <h3>HIGHLY COMPATIBLE</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
              </section>
            </div>
          </div>
        </section>
      )
  }
}
