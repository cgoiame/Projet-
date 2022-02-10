const Router = require('express-promise-router');
const _ = require('lodash');
const Posts = require('../../components/posts');

module.exports = (app) => {
  const router = Router();
  const posts = Posts(app);

  // Create
  router.post('/', async (req, res) => {
    const data = await posts.create(req.user, _.pick(req.body, 'content', 'title'));
    res.json(data);
  });

  // Get all
  router.get('/', async (req, res) => {
    const data = await posts.get();
    res.json(data);
  });

  // Get one
  router.get('/:id(\\d+)', async (req, res) => {
    const data = await posts.getOne(req.params.id);
    res.json(data);
  });

  // Update
  router.put('/:id(\\d+)', async (req, res) => {
    const data = await posts.update(req.params.id, _.pick(req.body, 'content', 'title'));
    res.json(data);
  });

  // Delete
  router.delete('/:id(\\d+)', async (req, res) => {
    const data = await posts.delete(req.params.id);
    res.json(data);
  });

  return Router().use('/posts', router);
};
