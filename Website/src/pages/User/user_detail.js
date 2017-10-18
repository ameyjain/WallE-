import React, { Component } from 'react';
import Header from '../../components/Header/static_header';

export default class UserDetail extends Component {
  render() {
    return (
      <div>
        <Header />
        <div id="wrapper">
          <div id="page-content-wrapper">
           <div className="container-fluid">
               <div className="row">
                  <div className="col-lg-12">
                    Welcome
                  </div>
                </div>
             </div>
          </div>
        </div>
      </div>
    );
  }
}
