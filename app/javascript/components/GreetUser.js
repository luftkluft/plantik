import React from "react"
import PropTypes from "prop-types"
import classes from './GreetUser.module.css'
class GreetUser extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div className={classes.red}>
          Name: {this.props.name}
        </div>
        <h3>Test2! Module css run!</h3>
      </React.Fragment>
    );
  }
}

GreetUser.propTypes = {
  name: PropTypes.string
};
export default GreetUser
