const path = require('path');

module.exports = {
	entry: './source/javascripts/all.js',
	output: {
		filename: 'all.js',
		path: path.resolve(__dirname, './build/javascripts')
	},
	module: {
		rules: [
		{
		 test: /\.(woff|woff2|eot|ttf|svg|ico|jpg|jpeg|png)$/,
		 use: [
		   {
		     loader: 'url-loader',
		     options: {
		       limit: 5000,
		       name: './assets/[name].[ext]'
		     }
		   }
		 ]
		}
		]
	}
};
