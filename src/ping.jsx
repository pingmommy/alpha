 import React from 'react';
 import ReactDOM from 'react-dom/client';
 import Alpha from './util/alpha.js';
 import  { sprintf } from 'sprintf-js';
import sleep from 'es7-sleep';
 import $ from 'jquery';
 import "./css/ping.css";

class Flow extends Alpha {
	
	position='relative'
	left =0;
	top =0;
	speed = 0;
	
	constructor (w,h) {
		super();	
		this.w =w;	
		this.h =h;	
	}
	
	setLine(line) {
		this.line = line;
		this.top = this.line * this.h;
	}	
	
	setColumn(column) {
		this.column = column;
		this.left = this.column * this.w;
	}	
	
}

class App extends React.Component {
	

	
	constructor(){
		super();
		let w = $('.collapse td').outerWidth();
		let h = $('.collapse td').outerHeight();
		
		for(let i=0; i<20; i++){
			this.state.surface[i]=[];
			let speed = Math.random()*100 +10;
			for(let j=0; j<40;j++){
				let flow = new Flow(w,h);
				flow.position='absolute';				
				flow.setLine(i);
				flow.setColumn(j);
				flow.speed = speed;
				this.state.surface[i][j]=flow;
			}
		}
	}
	
	state = {
		surface:[],
		disabled: false,
		rowNum: 0,
	
	}
	
	move(body,direction){
						 
		 for(let i=0; i<body.length-1; i++){
			 body[i].setColumn(body[i+1].column);
			 body[i].setLine(body[i+1].line);
		 }
		 
		 
		 let head = body[body.length-1];
		 
		 switch(direction){
			 case 1:       //top
			   head.setLine(--head.line);
				 break;
		     case 2:       //right
		        head.setColumn(++head.column);
				 break;
			 case 3:       //down
				head.setLine(++head.line);
				 break;
		     case 4:       //left
		        head.setColumn(--head.column);
				 break;		 
		 }
		this.forceUpdate();
	 }
	
	
	
	btnStart_click(e){	
		
		this.state.disabled = true;
		this.forceUpdate();
		for(let i =0; i<20; i++){
		this.pingpong(this.state.surface[i]);	
		}
	}
			
			
	btnStop_click(e){		
		
	}
			
	async pingpong(body) {
		
		let isRight = true;
		
		let head = body[body.length-1];
		
		for(;;){
		if(isRight)	
			this.move(body,2);
		else	
			this.move(body,4);
		await sleep(head.speed);
		
		
		
		if(head.column == 100)
			isRight =false;
		else if(head.column == 0)
			isRight =true;
			
			
		
		
		}
	}		

		
	render() {
		return(
			<>
			<button disabled={this.state.disabled} onClick={event => this.btnStart_click(event)} className='shape'>START</button>
			<button  disabled={!this.state.disabled} onClick={event => this.btnStop_click(event)} className='shape'>STOP</button>
			
			<table id='surface' className='collapse'
				onMouseDown={event=> event.preventDefault()}
				onContextMenu={event => event.preventDefault()}>
				<tbody>
				{
					this.state.surface.map((row,k) =>
						<tr key={k}>
						{
							row.map((v,k) =>
							<td key={k} style={{
								color:v.fg, 
								background:v.bg,
								position:v.position,
								left:v.left,
								top:v.top,
								transition:`left ${v.speed}ms linear`
								}}>{v.ch}</td>
						 )}
						
						</tr>
					)
				}
				</tbody>
			</table>
			<p>selecting된 row를 리스트로 표현해야...</p>
			</>
	)				
 }
}
let root = ReactDOM.createRoot(document.querySelector('#root')) 
root.render(<App/>)
 
 