FROM node:20-alpine
        WORKDIR /app
        COPY package*.json ./
        RUN npm install --production
        COPY deactivateExpiredLinks.js ./deactivateExpiredLinks.js
        COPY db/supabase.js ./db/supabase.js
        RUN chmod +x ./deactivateExpiredLinks.js
        CMD ["node", "./deactivateExpiredLinks.js"]