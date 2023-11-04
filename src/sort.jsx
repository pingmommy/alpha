 import React from 'react';
 import ReactDOM from 'react-dom/client';
 import Alpha from './util/alpha.js';
 import  { sprintf } from 'sprintf-js';
import sleep from 'es7-sleep';
 import $ from 'jquery';
 import "./css/sort.css";

class Sort extends Alpha {
	left =0;
	top=0;
	scale =1;
	zIndex = 0;
	
	constructor () {
		super();
		this.init();
	}
	
	init() {
		this.left =800;
		this.top= 100;
		this.scale=10;
	}
}

class App extends React.Component {
	
	zIndex =0;
	
	constructor(){
		super();			
		
	    for(let i=0; i<20; i++){
			this.state.surface[i]=[];
			for(let j=0;j<40; j++){
				let alpha = new Sort();
				alpha.zIndex = this.zIndex++;
				this.state.surface[i][j]= alpha;
			}
		}
	}
	
	state = {
		surface:[],
		forecount : 0,
		count: 0,
		ellipse: 0,
		disabled: false,
	}
	
	async sort1() {
		let w = $("#surface td:first-child").outerWidth();
		let h = $("#surface td:first-child").outerHeight();
		console.log(`${w},${h}`)
		
		for(let i=0; i<20; i++){
			for(let j=0; j<40; j++){
				this.state.surface[i][j].left=w*j;
				this.state.surface[i][j].top=h*i;
				this.state.surface[i][j].scale=1;
				this.forceUpdate();
				await sleep(100);
			}
		}
		await sleep(2000);
		await this.restore();
	}
	
	async sort2() {
		let w = $("#surface td:first-child").outerWidth();
		let h = $("#surface td:first-child").outerHeight();
		console.log(`${w},${h}`)
		
		for(let i=19; i>=0; i--){
			for(let j=0; j<40; j++){
				this.state.surface[i][j].left=w*j;
				this.state.surface[i][j].top=h*i;
				this.state.surface[i][j].scale=1;
				this.forceUpdate();
				await sleep(100);
			}
		}
		await sleep(2000);
		await this.restore();
	}
	
	
	
	async sort3() {
		let w = $("#surface td:first-child").outerWidth();
		let h = $("#surface td:first-child").outerHeight();
		console.log(`${w},${h}`)
		
		for(let i=19; i>=0; i--){
			for(let j=39; j>=0; j--){
				this.state.surface[i][j].left=w*j;
				this.state.surface[i][j].top=h*i;
				this.state.surface[i][j].scale=1;
				this.forceUpdate();
				await sleep(100);
			}
		}
		await sleep(2000);
		await this.restore();
	}
	
	
	async sort4() {
		let w = $("#surface td:first-child").outerWidth();
		let h = $("#surface td:first-child").outerHeight();
		console.log(`${w},${h}`)
		
		for(let i=0; i<40; i++){
			for(let j=0; j<20; j++){
				this.state.surface[j][i].top=h*j;
				this.state.surface[j][i].left=w*i;
				this.state.surface[j][i].scale=1;
				this.forceUpdate();
				await sleep(100);
			}
		}
		
		await sleep(2000);
		await this.restore();
	}
	
	async sort5() {
		let w = $("#surface td:first-child").outerWidth();
		let h = $("#surface td:first-child").outerHeight();
		
		for(let i =39; i>=0; i--){
			for(let j=19; j>=0; j--){
				this.state.surface[j][i].top=h*j;
				this.state.surface[j][i].left=w*i;
				this.state.surface[j][i].scale=1;
				this.state.surface[j][i].zIndex = this.zIndex++;
				this.forceUpdate();
				await sleep(100);
			}
		}
			await sleep(2000);
			await this.restore();			
	}
	
	
	async restore() {
		for(let i =0; i<20; i++){
			for(let j=0; j<40; j++){
				this.state.surface[i][j].init();
			}
		}
		this.forceUpdate();
		
		
		await sleep(1000);
		this.state.disabled=false;
		this.forceUpdate();
	}
	
	sortNum =1;
	 btnStart_click(e){
		this.state.disabled = true;
		this.forceUpdate();
		
		console.log(this.sortNum);
		
		switch(this.sortNum){
				case 1: this.sort1();
				break;
				case 2: this.sort2();
				break;
				case 3: this.sort3();
				break;
				case 4: this.sort4();
				break;
				case 5: this.sort5();
				break;
		}
		
	/*	this.state.surface[0][0].left=0;
		this.state.surface[0][0].top=0;
		this.state.surface[0][0].scale=1;

		this.state.surface[0][1].left=w;
		this.state.surface[0][1].top=0;
		this.state.surface[0][1].scale=1;

		this.state.surface[0][2].left=w*2;
		this.state.surface[0][2].top=0;
		this.state.surface[0][2].scale=1;*/
		
		
		
	}
	
	
	onSelect(sortNum) {
		this.sortNum = sortNum;
		this.forceUpdate();
	}
		
	render() {
		return(
			<>
			<div className="flex-center">
				<button disabled={this.state.disabled} onClick={event => this.btnStart_click(event)} className="shape">START</button>
				<label>ROW[0][0]</label>
				<input name='sort' type='radio' onChange={() =>this.onSelect(1) } checked={this.sortNum==1}/>
				<label>ROW[20][0]</label>
				<input name='sort' type='radio' onChange={() => this.onSelect(2)}   checked={this.sortNum==2}/>
				<label>ROW[20][40]</label>
				<input name='sort' type='radio' onChange={() => this.onSelect(3) }  checked={this.sortNum==3}/>
				<label>COLUMN[0][0]</label>
				<input name='sort' type='radio' onChange={() =>this.onSelect(4) }  checked={this.sortNum==4}/>
				<label>COLUMN[20][40]</label>
				<input name='sort' type='radio' onChange={() =>this.onSelect(5) }  checked={this.sortNum==5}/>
			</div>
			<table id='surface' className='collapse'
/*			<table style={{borderCollapse:'collapse', fontFamily:'monospace',fontSize:'2em'} }*/
			onMouseDown={event=> event.preventDefault()}
			onContextMenu={event => event.preventDefault()}
			>
				<tbody>
				{
					this.state.surface.map((row,k) =>
						<tr key={k}>
						{
							row.map((v,k) =>
							<td key={k} style={{
								color:v.fg, 
								background:v.bg,
								top:v.top,
								left:v.left,
								transform:`scale(${v.scale})`,
								zIndex:v.zIndex
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
 
 