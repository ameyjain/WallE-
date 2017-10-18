import { Component } from 'react';
import { connect } from 'react-redux';
import * as actions from '../../actions/authAction';
import PropTypes from 'prop-types';

class Logout extends Component {
  static contextTypes = {
    router: PropTypes.object
  }
  componentWillMount() {
    this.props.logoutUser();
    this.context.router.push('/login');
  }

  render() {
    return null;
  }
}
function mapStateToProps(state) {
  return {
    warningMessage: state.auth.warning
  };
}

export default connect(mapStateToProps, actions)(Logout);
