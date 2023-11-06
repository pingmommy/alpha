 import React from 'react';
 import ReactDOM from 'react-dom/client';
 import Alpha from './util/alpha.js';
 import  { sprintf } from 'sprintf-js';
import sleep from 'es7-sleep';
 import $ from 'jquery';
 import "./css/flow.css";

class Flow extends Alpha {
	
	/*position='relative'*/
	left =0;
	top =0;
	
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
			for(let j=0; j<40;j++){
				let flow = new Flow(w,h);
				flow.position='absolute';				
				flow.setLine(i);
				flow.setColumn(j);
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
	
	
	
btnLeft_click(e){		
			this.move(this.state.surface[this.state.rowNum], 4);		
		}
		
		
btnRight_click(e){		
		this.move(this.state.surface[this.state.rowNum], 2);			
		}
		
btnUp_click(e){
			this.move(this.state.surface[this.state.rowNum], 1);
		}
		
 btnDown_click(e){
			this.move(this.state.surface[this.state.rowNum], 3);
		}
		
	render() {
		return(
			<>
			<button  onClick={event => this.btnLeft_click(event)} className='shape'>LEFT</button>
			<button  onClick={event => this.btnRight_click(event)} className='shape'>RIGHT</button>
			<button  onClick={event => this.btnUp_click(event)} className='shape'>UP</button>
			<button  onClick={event => this.btnDown_click(event)} className='shape'>DOWN</button>
			<select on onChange={ event => this.state.rowNum = event.target.value}>
				{
					this.state.surface.map((row,i) =>
					 <option key={i}>{i}</option>
					)
				}
			</select>
		
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
								}}>{v.ch}</td>
						 )}
						
						</tr>
					)
				}
				</tbody>
			</table>
			</>
	)				
 }
}
let root = ReactDOM.createRoot(document.querySelector('#root')) 
root.render(<App/>)
 
 