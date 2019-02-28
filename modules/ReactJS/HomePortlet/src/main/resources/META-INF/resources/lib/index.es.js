import React from 'react';
import ReactDOM from 'react-dom';
import Board from './Components/Board';

class Game extends React.Component {
	render() {
		return (
			<div className="game">
				<div className="game-board">
					<Board />
				</div>
				<div className="game-info">
					<div>{/* status */}</div>
					<ol>{/* TODO */}</ol>
				</div>
			</div>
		);
	}
}

export default function(elementId) {ReactDOM.render(<Game />, document.getElementById(elementId));}