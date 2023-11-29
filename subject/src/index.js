const app = require('./app');
const connectDB = require('./config/database');
const logger = require('./utils/logger.utils');
const environmentConfig = require('./config/environment.config');
const listEndpoints = require('express-list-endpoints');
const { logAllRoutes } = require('./utils/misc.utils');
const importSubjectData = require('./import-data');

connectDB()
  .then(() => {
    logger.info('Connected to DATABASE');
    app.listen(environmentConfig.port, () => {
      logger.info('App listening on port ' + environmentConfig.port);
      logAllRoutes(listEndpoints(app));
      importSubjectData();
    });
  })
  .catch((err) => {
    console.log(err);
    logger.error(err);
  });
