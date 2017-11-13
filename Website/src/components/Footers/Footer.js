import React, { Component } from 'react';
import { connect } from 'react-redux'
import NavItem from '../Header/NavItem';

export default class Footer extends Component {

  render() {
      return (

        <section id="footer">
          <div className="inner">
          	<section className="content">
              <h4><u><NavItem to="/contact">FAQ</NavItem></u></h4>
              <h4><u><NavItem to="/contact">CONTACT</NavItem></u></h4>
              <h4><u><NavItem to="/">SHOP</NavItem></u></h4>
          	</section>

          	<section className="middle">
          		<h4>ABOUT US</h4>
          		<p>Wall-e believes in bringing products that make your environment smart by bringing the best technology together and at an affordable rate. We make smart things smarter.</p>
          	</section>

          	<aside className="sidebar">
          		<h4>NEW RELEASE</h4>
          		<p>The first ever smart speaker that can become a google home and alexa at your command. Giving you the best of both worlds.</p>

              <form method="post" action="#">
                <div className="field">
                  <input type="email" name="email" id="email" placeholder="Email Adress" />
                </div>
                <ul className="actions vertical">
                <li><a href="#first" className="button big wide smooth-scroll-middle special">Subscribe Now</a></li>
                </ul>
              </form>
          	</aside>

            <div className="footer-social-icons">
                <ul className="social-icons">
                    <li><a href="" className="social-icon"> <i className="fa fa-facebook"></i></a></li>
                    <li><a href="" className="social-icon"> <i className="fa fa-twitter"></i></a></li>
                    <li><a href="" className="social-icon"> <i className="fa fa-instagram"></i></a></li>
                </ul>
                <p>WALL-E INC.</p>
            </div>
          </div>
        </section>
       )
  }
}
