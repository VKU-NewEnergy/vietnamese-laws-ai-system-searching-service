const { dataSource } = require('../config/database/data-source');
const CharterEntity = require('./entities/charter.entity');

const charterRepo = dataSource.getRepository(CharterEntity);

class ChartersRepository {
  getAllByConditions(conditions = {}) {
    return charterRepo.find(conditions);
  }

  getOneByCondition(conditions = {}) {
    return charterRepo.findOne(conditions);
  }

  insertOne(data) {
    return charterRepo.save(data);
  }

  insertMany(data) {
    const listTopicEntities = charterRepo.create(data);
    return charterRepo.insert(listTopicEntities);
  }

  update(id, data) {
    return charterRepo.update({ id }, data);
  }
}

module.exports = new ChartersRepository();
