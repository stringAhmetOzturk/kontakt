import { format,transports,createLogger } from 'winston'

const logger = createLogger({
  level: 'info',
  format: format.combine(format.timestamp({format:'YYYY-MM-DD HH:mm:ss'}),format.json()),
  transports: [
    new transports.File({ filename: 'logs/error.log', level: 'error' }),
    new transports.File({ filename: 'logs/info.log', level:'info' }),
  ],
});

export default logger