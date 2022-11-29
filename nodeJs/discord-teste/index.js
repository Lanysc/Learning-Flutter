const Discord = require('discord.js');
const client = new Discord.Client({
	intents: [
		Discord.GatewayIntentBits.Guilds,
		Discord.GatewayIntentBits.GuildMessages,
		Discord.GatewayIntentBits.MessageContent,
		Discord.GatewayIntentBits.GuildMembers,
	],
});


const TOKEN = 'MTA0NzE0MTQxODI5NDA1MDg2Ng.GYlWus.fMloicTTIVSWsTLIpZFEkQx6Uv3sYDvfELIinA';

client.on("ready", () => {
	console.log('estou online!');
});

module.exports = {
	data: new SlashCommandBuilder()
		.setName('ping')
		.setDescription('Replies with Pong!'),
	async execute(interaction) {
		await interaction.reply('Pong!');
	},
};

client.on("messageCreate", (msg) => {
	if(msg.content === 'ping') {
		msg.reply('pong');
	}
});

client.login(TOKEN);