import React, { Component } from 'react';

class Bar extends Component {
  constructor(props) {
    super(props);
    this.state = {
      row: ''
    };
    this.setRow = this.setRow.bind(this);
  }

  setRow(id) {
    if (id % 8 === 0) {
      this.setState({ row: 'row' });
    } else if (id % 8 === 1){
      this.setState({ row: '' });
    }
  }

  componentDidMount() {
    this.setRow(this.props.id)
  }

  render() {

    return (
      <div className={this.state.row}>
        <div className="card medium-4 columns">
          <div className="card-divider">
            <img src={this.props.image_url} className="image" />
            <div className="card-section">
              <div className="info">
                <p> {this.props.name}  </p>
                <p> Rating: {this.props.rating} </p>
                <a href={`bars/${this.props.id}`} className="view">View Bar</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Bar;
