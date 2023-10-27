 import React from 'react';
 import ReactDOM from 'react-dom/client';
 import Alpha from './util/alpha.js';
 import  { sprintf } from 'sprintf-js';
import sleep from 'es7-sleep';
import $ from 'jquery';
import"./css/cross.css";


class Cross extends Alpha {
	
	/** @param {Surface} surface */
	constructor (surface) {
		super();	
		this.surface = surface;
		this.surface.state.count++;
		
		this.line = 10;
		this.column=20;
		
		this.direction = parseInt(Math.random()*4);
		this.show();
		
		this.tid=setInterval(()=>this.move(),Math.random()*200+10);
	}
	
	show() {
		this.surface.state.rect[this.line-1][this.column-1]= this;
		console.log(this);
		this.surface.forceUpdate();
		
	}
	
	hide() {
		this.surface.state.rect[this.line-1][this.column-1]={
			fg : 'black',
			bg : 'black',
			ch : '@'
		};
		this.surface.forceUpdate();
	}
	
	move(){
		this.hide();
		
		switch(this.direction){
			case 0: //up
				this.line--;
				break;
			case 1: //right
				this.column++;
				break;
			case 2: //down
				this.line++;
				break; 	
			case 3: //left
				this.column--;
				break;		
		}
		
		if(this.line<1 || this.line>20 || this.column<0 || this.column>40){
			clearInterval(this.tid);
			this.surface.state.count--;
			this.surface.forceUpdate();
			return;
		}
		this.show();
	}
}

class Surface extends React.Component {
	

	
	constructor(){
		super();
		this.init();
		
		console.log(this.state.rect);
	}
	
	init() {
		let rect = this.state.rect;
		
		for(let i=0; i<20; i++){
			rect[i] =[]
			for(let j=0; j<40; j++) {
				let alpha = {
					fg: 'black',
					bg: 'black',
					ch: '@'
				}
				rect[i][j]=alpha;
			}
		}
		
		
	}
	
	state = {
		rect : [],
		forCount: 0,
		count:0,
		isStart: false,
	}
	
	/** @param {MouseEvent} e */
	
	async start(e) {
		console.log(this);
		this.state.isStart =true;
		
		this.init();
		this.forceUpdate();
		
		while(this.state.isStart){
			let cross= new Cross(this);
			this.state.forCount++;
			await sleep(100);
		}
	}
	
	/** @param {MouseEvent} e */
	stop(e) {
		this.state.isStart = false;
		this.forceUpdate();
	}
	
		
	render() {
		return(
			<>
			<div style={{margin: '0px auto'}}>
			<button disabled={this.state.isStart}  onClick={this.start.bind(this)} className='shape'>START</button>	
			<button disabled={!this.state.isStart}  onClick={this.stop.bind(this)} className='shape'>STOP</button>
			</div>
			<div>
			<table>
				<thead>
					<tr>
						<th style={{width:'100px'}}>forCount</th>
						<th style={{width:'100px'}}>Count</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					 <td align='right'>{this.state.forCount}</td>
					 <td align='right'>{this.state.count}</td>
					</tr>
				</tbody>
			</table>
			<table id='table1' style = {{
				borderCollapse : "collapse",
				fontFamily :'monospace',
				fontSize : "15pt"
			}} bgcolor='black'>
				<tbody>
				{
					this.state.rect.map((line,i) => 
					<tr key ={i}>
					{
						line.map((alpha,j) => 
							<td key={j} style={{color:alpha.fg, background:alpha.bg}}>{alpha.ch}</td>
						)
					}
					</tr>
					)
				}
				</tbody>	
			</table>
			</div>
			</>
	)				
 }
}
let root = ReactDOM.createRoot(document.querySelector('#root')) 
root.render(<Surface/>)
 
 