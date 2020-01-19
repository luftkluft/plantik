import React, { Component } from 'react'
import Button from '@material-ui/core/Button';

class TestComponent extends Component {
  render() {
    return (
      <div>
        <p>Hello TestComponent!</p>
        <Button variant="contained" color="primary">
          Hello World
        </Button>
      </div>
    );
  }
}

export default TestComponent