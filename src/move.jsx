 import React from 'react';
 import ReactDOM from 'react-dom/client';
 import Alpha from './util/alpha.js';
 import  { sprintf } from 'sprintf-js';
import sleep from 'es7-sleep';
 import $ from 'jquery';
 import "./css/move.css";

class Move extends Alpha {
	/*핵심은 left, top. 좌표와 position : relative속성을 사용하여 움직일 수 있다. */
	left =0;
	top=0;
	speedLeft = 0;
	speedRotate = 0;
	speedTop = 0;
	degree = 0;
	constructor () {
		super();
		this. init();
	}
	
	init(){
		this.speedLeft = Math.random()*3;
		this.speedRotate = Math.random()*3;
		this.speedTop = Math.random()*3;
		
	}
	
}

class App extends React.Component {

	constructor(){
		super();
		for(let i=0; i<10;i++){
			this.state.surface[i]=[];
			for(let j=0; j<20;j++){
				this.state.surface[i][j]=new Move();
			}
		}			
		
	}
	
	state = {
		surface:[],
		disabled: false,
	
	}
	
	
	async move(){
			for(;;){
		
		
		let a =  Math.random()*700;
		console.log(a);
		
		for(let i=0; i<10; i++){
			for(let j=0; j<20; j++){
				this.state.surface[i][j].left =	a;
				this.state.surface[i][j].top = a;	
				this.state.surface[i][j].degree = 360*parseInt(Math.random()*10);
				}
			}
			this.forceUpdate();
			await sleep(3000);
			
			if(this.isStop)
			  break;
		}	
	}
	
	
	btnStart_click(e){
		
		this.state.disabled = true;
		this.forceUpdate();
		
		this.isStop = false;
	    this.move();
			
		}
		
		isStop = false;
		 btnStop_click(e){
		  this.state.disabled = false;
		  this.forceUpdate();
		  this.isStop = true;		
		}
		
	render() {
		return(
			<>
			<button disabled={this.state.disabled} onClick={event => this.btnStart_click(event)}>start</button>
			<button disabled={!this.state.disabled} onClick={event => this.btnStop_click(event)}>stop</button>
			
			<hr/>

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
								left:v.left,
								top:v.top,
								transition:`left ${v.speedLeft}s,top ${v.speedTop}s, transform ${v.speedRotate}s`,
								transform:`rotate(${v.degree}deg)`,
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
 
 