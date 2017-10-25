import React, { Component } from 'react';
import { connect } from 'react-redux'

export default class Footer extends Component {

  render() {
      return (
        <div>
        <section id="footer">
          <div className="inner">
            <form method="post" action="#">
              <div className="field">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" />
              </div>
              <ul className="actions">
                <li><input type="submit" value="Subscribe Now" /></li>
              </ul>
            </form>

            <ul className="footer-social-icons social-icons">
                <li><a href="https://facebook.com/amey14" className="social-icon"> <i className="fa fa-facebook"></i></a></li>
                <li><a href="https://twitter.com/geeksOnly" className="social-icon"> <i className="fa fa-twitter"></i></a></li>
                <li><a href="https://instagram.com/ameyjain" className="social-icon"> <i className="fa fa-instagram"></i></a></li>
            </ul>
            <ul className="copyright">
              <li>&copy; Wall-e Inc. All rights reserved.</li>
            </ul>
          </div>
        </section>
        </div>
      )
  }
}
